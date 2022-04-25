package com.devsuperior.dslearnbds.resources;

import java.net.URI;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.devsuperior.dslearnbds.entities.dto.NotificationDTO;
import com.devsuperior.dslearnbds.services.NotificationService;	

@RestController
@RequestMapping(value = "/notifications")
public class NotificationResource {
	@Autowired
	private NotificationService notificationService;

	@GetMapping
	public ResponseEntity<Page<NotificationDTO>> notificationsForCurrentUser(Pageable pageable) {

		Page<NotificationDTO> notifications = notificationService.findAllPaged(pageable);

		return ResponseEntity.ok().body(notifications);

	}

	@GetMapping(value = "/{id}")
	public ResponseEntity<NotificationDTO> findById(@PathVariable Long id) {
		NotificationDTO dto = notificationService.findById(id);
		return ResponseEntity.ok().body(dto);
	}

	@PostMapping
	public ResponseEntity<NotificationDTO> insert(@Valid @RequestBody NotificationDTO dto) {
		NotificationDTO returnedDTO = notificationService.insert(dto);
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(returnedDTO.getId())
				.toUri();
		return ResponseEntity.created(uri).body(returnedDTO);
	}

	@PutMapping(value = "/{id}")
	public ResponseEntity<NotificationDTO> update(@PathVariable Long id, @Valid @RequestBody NotificationDTO dto) {
		NotificationDTO notification = notificationService.update(id, dto);
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(dto.getId()).toUri();
		return ResponseEntity.created(uri).body(notification);
	}

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> delete(@PathVariable Long id) {
		notificationService.delete(id);
		return ResponseEntity.noContent().build();
	}
}
