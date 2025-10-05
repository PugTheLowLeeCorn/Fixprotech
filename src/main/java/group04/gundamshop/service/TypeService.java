package group04.gundamshop.service;

import group04.gundamshop.domain.Type;
import group04.gundamshop.repository.TypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TypeService {

    @Autowired
    private TypeRepository typeRepository;

    public List<Type> getAllTypes() {
        return typeRepository.findAll();
    }

    public List<Type> getTypesByStatus(boolean status) {
        return typeRepository.findByStatus(status);
    }

    public Optional<Type> getTypeById(Long id) {
        return typeRepository.findById(id);
    }

    public Type saveType(Type type) {
        return typeRepository.save(type);
    }

    public void deleteType(Long id) {
        typeRepository.deleteById(id);
    }
} 