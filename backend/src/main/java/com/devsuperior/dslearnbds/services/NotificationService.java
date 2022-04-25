package com.devsuperior.dslearnbds.services;

import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.devsuperior.dslearnbds.entities.Notification;
import com.devsuperior.dslearnbds.entities.User;
import com.devsuperior.dslearnbds.entities.dto.NotificationDTO;
import com.devsuperior.dslearnbds.repositories.NotificationRepository;
import com.devsuperior.dslearnbds.repositories.UserRepository;
import com.devsuperior.dslearnbds.services.exceptions.DatabaseException;
import com.devsuperior.dslearnbds.services.exceptions.ResourceNotFoundException;;

@Service
public class NotificationService {

	@Autowired
	private NotificationRepository notificationRepository;

	@Autowired
	private AuthService authService;	
	@Autowired
	private UserRepository userRepository;


	public NotificationService() {
	}

	@Transactional(readOnly = true)
	public Page<NotificationDTO> findAllPaged(Pageable pageable) {

		User user = authService.authenticated();

		Page<Notification> notifications = notificationRepository.findByUser(user, pageable);
		return notifications.map(notf -> new NotificationDTO(notf));
	}

	@Transactional(readOnly = true)
	public NotificationDTO findById(Long id) {
		Optional<Notification> object = notificationRepository.findById(id);
		Notification entity = object.orElseThrow(() -> new ResourceNotFoundException("Entity not Found"));
		return new NotificationDTO(entity);
	}

	@Transactional
	public NotificationDTO insert(NotificationDTO dto) {
		Notification entity = new Notification();
		copyDTOToEntity(dto, entity);
		entity = notificationRepository.save(entity);
		return new NotificationDTO(entity);
	}

	@Transactional
	public NotificationDTO update(Long id, NotificationDTO dto) {
		Notification entity;
		try {
			entity = notificationRepository.getOne(id);
			copyDTOToEntity(dto, entity);
			entity = notificationRepository.save(entity);
		} catch (EntityNotFoundException e) {
			throw new ResourceNotFoundException("Id Not Found: " + id);
		}
		return new NotificationDTO(entity);
	}

	public void delete(Long id) {
		try {
			notificationRepository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			throw new ResourceNotFoundException("Id Not Found: " + id);
		} catch (DataIntegrityViolationException e) {
			throw new DatabaseException("Integrity Violation");
		}
	}

	private void copyDTOToEntity(NotificationDTO dto, Notification entity) {
		entity.setMoment(dto.getMoment());
		entity.setRead(dto.isRead());
		entity.setRoute(dto.getRoute());
		entity.setText(dto.getText());		
		Optional<User> user = userRepository.findById(dto.getUserId());	
		entity.setUser(user.get());

	}

}
